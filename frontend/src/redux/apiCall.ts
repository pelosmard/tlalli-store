import Swal from 'sweetalert2';
import { SingleProductResponse } from '../interfaces/SingleProduct';
import { publicRequest, userRequest } from '../requestMethods';
import { logout } from './actions/auth';
import { removeLoading, setLoading } from "./uiRedux";
import { startFetching } from './userRedux';
import axios from 'axios';

const BASE_URL = "https://olympus-backend.vercel.app/api";
//const BASE_URL = "http://localhost:8080/api";


export const getSingleProduct = async (dispatch, productId: string) => {
    try {
        dispatch(startFetching());
        const product = await publicRequest.get(`/products/find/${productId}`) as SingleProductResponse;
        const { data } = product;
        return data;
    } catch (error) {
        dispatch(removeLoading());
        console.log(error);
    }
}

export const getAllProducts = async (dispatch, category: any) => {
    dispatch(setLoading());
    try {
        //const products: any = await publicRequest.get(category ? `/products/category?category=${category}` : '/products');
        const products: any = await publicRequest.get(category ? `http://localhost:8080/api/products/category/${category}` : 'http://localhost:8080/api/products');


        console.log(products);

        const { data } = products;
        dispatch(removeLoading());
        return data;
    } catch (error) {
        dispatch(removeLoading());
        console.log(error);
    }
}

export const getUserPurchases = async (dispatch, id: string, accessToken: string) => {
    dispatch(setLoading());
    try {
        const purchasesData = await axios.get(`https://olympus-backend.vercel.app/api/orders/find/${id}`, { params: { id: id }, headers: { token: `Bearer ${accessToken}` } });
        const { data } = purchasesData;
        dispatch(removeLoading());
        return data;
    } catch (error) {
        dispatch(removeLoading());
        console.log(error);
    }
}


export const makePurchaseRequest = async (dispatch, stripeData, userId: string, accessToken: string) => {
    dispatch(setLoading());
    try {
        const purchaseRequest = await axios.post(`${BASE_URL}/checkout/payment`, stripeData, { params: { id: userId }, headers: { token: `Bearer ${accessToken}` } })
        const { data } = purchaseRequest;
        dispatch(removeLoading());
        return data;
    } catch (error) {
        dispatch(removeLoading());
        console.log(error);
    }
}


export const successPurchaseRequest = async (dispatch, stripeData, userId: string, accessToken: string) => {
    dispatch(setLoading());
    try {
        const purchaseRequest = await axios.post(`${BASE_URL}/orders`, stripeData, { params: { id: userId }, headers: { token: `Bearer ${accessToken}` } })
        const { data } = purchaseRequest;
        dispatch(removeLoading());
        return data;
    } catch (error) {
        dispatch(removeLoading());
        console.log(error);
    }
}

export const cancelPurchase = async (dispatch, id: string, _id: string, refreshPage) => {
    dispatch(setLoading());
    try {
        const response = await userRequest.delete(`/orders/${id}`, { params: { id: _id } });
        const { data } = response;
        dispatch(removeLoading());
        if (data === "Order has been deleted...") {
            Swal.fire({
                icon: "success",
                title: "Exito",
                text: "Tu compra ha sido cancelada correctamente",
                confirmButtonColor: "3085d6",
                confirmButtonText: "Ok",
                didClose: () => refreshPage()
            });
        }
    } catch (error) {
        dispatch(removeLoading());
        console.log(error);
    }
}

export const updateUser = async (dispatch, values, handleLogout) => {
    try {
        dispatch(setLoading());
        console.log(values);
        await userRequest.put(`/users/${values.id}`, values, { params: { id: values.id } });
        Swal.fire({
            icon: "success",
            title: "Exito",
            text: "Tu cuenta ha sido actualizada correctamente",
            didClose: () => {
                handleLogout();
            }
        });
        dispatch(removeLoading());
    } catch (error) {
        dispatch(removeLoading());
        Swal.fire({
            icon: "error",
            title: "Error",
            text: "No ha sido posible actualizar la cuenta",
        });
    }
}

export const deleteUser = async (dispatch, userId: string, accessToken, navigateToHome) => {
    try {
        dispatch(setLoading());
        await axios.delete(`/users/${userId}`, { params: { id: userId }, headers: { token: `Bearer ${accessToken}` } });
        Swal.fire({
            icon: "success",
            title: "Exito",
            text: "Tu cuenta ha sido eliminada correctamente",
            didClose: () => {
                navigateToHome();
            }
        });
        dispatch(logout());
        dispatch(removeLoading());
    } catch (error) {
        dispatch(removeLoading());
        Swal.fire({
            icon: "error",
            title: "Error",
            text: "No ha sido posible eliminar la cuenta",
        });
    }
}