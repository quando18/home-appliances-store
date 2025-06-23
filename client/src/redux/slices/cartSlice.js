import { createSlice } from '@reduxjs/toolkit';

const initialState = {
    items: [],
    itemCount: 0,
    lastAddResult: null,
};

// Khôi phục trạng thái giỏ hàng từ localStorage
const loadCartFromLocalStorage = () => {
    try {
        const serializedCart = localStorage.getItem('cart');
        if (serializedCart === null) {
            return initialState;
        }
        const parsedCart = JSON.parse(serializedCart);
		console.log("serializedCart---------> ", serializedCart);
		console.log("parsedCart---------> ", parsedCart);
        return {
            ...parsedCart,
            items: Array.isArray(parsedCart.items) ? parsedCart.items : [],
        };
    } catch (e) {
        console.error("Could not load cart from localStorage", e);
        return initialState;
    }
};

const saveCartToLocalStorage = (state) => {
    try {
        const serializedCart = JSON.stringify(state);
        localStorage.setItem('cart', serializedCart);
    } catch (e) {
        console.error("Could not save cart to localStorage", e);
    }
};

const cartSlice = createSlice({
    name: 'cart',
    initialState: loadCartFromLocalStorage(),
    reducers: {
        addToCart: (state, action) => {
            state.items = state.items || [];
            const existingProductIndex = state.items.findIndex(item => item.id === action.payload.id);
            const productStock = action.payload.number || 0;

            if (existingProductIndex >= 0) {
                // Nếu sản phẩm đã tồn tại, kiểm tra tổng số lượng không vượt quá tồn kho
                const currentQuantity = state.items[existingProductIndex].quantity;
                const newQuantity = currentQuantity + action.payload.quantity;

                if (newQuantity > productStock) {
                    // Nếu vượt quá tồn kho, chỉ thêm số lượng tối đa có thể
                    state.items[existingProductIndex].quantity = productStock;
                    // Có thể thêm flag để component biết và hiển thị thông báo
                    state.lastAddResult = {
                        success: false,
                        message: `Chỉ có thể thêm tối đa ${productStock} sản phẩm. Đã cập nhật số lượng trong giỏ hàng.`
                    };
                } else {
                    state.items[existingProductIndex].quantity = newQuantity;
                    state.lastAddResult = { success: true };
                }
            } else {
                // Nếu sản phẩm chưa tồn tại, kiểm tra số lượng muốn thêm
                if (action.payload.quantity > productStock) {
                    // Nếu vượt quá tồn kho, thêm số lượng tối đa có thể
                    state.items.push({ ...action.payload, quantity: productStock });
                    state.lastAddResult = {
                        success: false,
                        message: `Chỉ có thể thêm tối đa ${productStock} sản phẩm.`
                    };
                } else {
                    state.items.push({ ...action.payload, quantity: action.payload.quantity });
                    state.lastAddResult = { success: true };
                }
            }

            // Tính lại itemCount bằng cách tính tổng số lượng các sản phẩm trong giỏ hàng
            state.itemCount = state.items.reduce((count, item) => count + item.quantity, 0);

            // Lưu trạng thái giỏ hàng vào localStorage
            saveCartToLocalStorage(state);
        },
        removeFromCart: (state, action) => {
            state.items = state.items || [];
            const updatedItems = state.items?.filter(item => item.id !== action.payload.id);
            state.items = updatedItems;

            // Tính lại itemCount sau khi xóa sản phẩm
            state.itemCount = state.items.reduce((count, item) => count + item.quantity, 0);

            saveCartToLocalStorage(state);
        },
        clearCart: (state) => {
            state.items = [];
            state.itemCount = 0;

            saveCartToLocalStorage(state);
        },
        setAllCart: (state, action) => {
            console.info("===========[] ===========[action.payload] : ", action.payload);
            // state.items = action.payload;
            let items =  action.payload || [];
            state.items =  items;
            state.itemCount = items.reduce((count, item) => count + item.quantity, 0);
            saveCartToLocalStorage(state);

        },
    },
});

export const { addToCart, removeFromCart, clearCart, setAllCart } = cartSlice.actions;
export default cartSlice.reducer;
