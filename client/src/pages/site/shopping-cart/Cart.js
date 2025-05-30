import React, { useState, useEffect, startTransition } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import { Container, Button, Table, Form } from 'react-bootstrap';
import { setAllCart, clearCart } from "../../../redux/slices/cartSlice";
import { useDispatch, useSelector } from "react-redux";
import { FaTrashAlt, FaCheckCircle, FaHome, FaPlus, FaMinus, FaShoppingCart } from 'react-icons/fa';
import { toast } from 'react-toastify';
import './Cart.css';
import { formatPrice } from '../../../helpers/formatters';

const Cart = () => {
    const [cartItems, setCartItems] = useState([]);
    const [itemCount, setItemCount] = useState(0);
    const [selectAll, setSelectAll] = useState(false); // trạng thái của checkbox Select All

    const dispatch = useDispatch();
    const navigate = useNavigate();

    useEffect(() => {
        const savedCart = localStorage.getItem('cart');
        if (savedCart) {
            try {
                const parsedCart = JSON.parse(savedCart);
                if (parsedCart && Array.isArray(parsedCart.items)) {
                    const itemsWithSelected = parsedCart.items.map(item => ({
                        ...item,
                        selected: item.selected || false // ban đầu không chọn sản phẩm nào
                    }));
                    setCartItems(itemsWithSelected);
					let total = itemsWithSelected?.reduce((totalItem, item ) => {
						totalItem = totalItem + (item?.selected ? Number(item.quantity) : 0);
						return totalItem;
					}, 0)
                    setItemCount(total);
                } else {
                    console.error("Giỏ hàng không có items hợp lệ", parsedCart);
                }
            } catch (error) {
                console.error("Không thể phân tích dữ liệu từ localStorage", error);
            }
        }
    }, []);

    const updateCartInLocalStorage = (items) => {
		console.log("cart update------> ", items);
        const updatedCart = {
            items: items.map(({  ...rest }) => rest), // không lưu trạng thái selected vào localStorage
            itemCount: items.reduce((count, item) => count + item.quantity, 0)
        };
        setItemCount(updatedCart.itemCount);
        dispatch(setAllCart(updatedCart.items));
        localStorage.setItem('cart', JSON.stringify(updatedCart));
    };

    const handleQuantityChange = (id, quantity) => {
        setCartItems(prevItems => {
            const updatedItems = prevItems.map(item =>
                item.id === id ? { ...item, quantity: Math.max(1, quantity) } : item
            );
            updateCartInLocalStorage(updatedItems);
            return updatedItems;
        });
    };

    const handleRemoveItem = (id) => {
        const updatedItems = cartItems.filter(item => item.id !== id);
        updateCartInLocalStorage(updatedItems);
        setCartItems(updatedItems);
    };

    const handleSelectAll = (e) => {
        const isChecked = e.target.checked;
        setSelectAll(isChecked);
        const updatedItems = cartItems.map(item => ({
            ...item,
            selected: isChecked
        }));
		let total = updatedItems?.reduce((totalItem, item ) => {
			totalItem = totalItem + (item?.selected ? Number(item.quantity) : 0);
			return totalItem;
		}, 0)
		setItemCount(total);
        setCartItems(updatedItems);
		updateCartInLocalStorage(updatedItems)
    };

    const handleSelectItem = (id, isChecked) => {
        const updatedItems = cartItems.map(item =>
            item.id === id ? { ...item, selected: isChecked } : item
        );
        setCartItems(updatedItems);

        // Nếu có ít nhất 1 sản phẩm chưa chọn => bỏ check select all
        const allSelected = updatedItems.every(item => item.selected);
		let total = updatedItems?.reduce((totalItem, item ) => {
			totalItem = totalItem + (item?.selected ? Number(item.quantity) : 0);
			return totalItem;
		}, 0)
		setItemCount(total);
        setSelectAll(allSelected);
		updateCartInLocalStorage(updatedItems)

    };

    const getTotalPrice = () => {
        return cartItems
            .filter(item => item.selected)
            .reduce((total, item) => total + item.price * item.quantity, 0);
    };

    const handleCheckout = () => {
        const selectedItems = cartItems.filter(item => item.selected);
        if (selectedItems.length == 0) {
            toast.error("Vui lòng chọn ít nhất một sản phẩm để thanh toán.");
            return;
        }
        startTransition(() => {
            navigate("/checkout", { state: { selectedItems } });
        });
    };

    const handleRemoveAllCart = () => {
        dispatch(clearCart());
        setCartItems([]);
        setItemCount(0);
        toast.success("Xoá tất cả sản phẩm trong giỏ hàng thành công");
    };

    return (
        <div className="hebekery-cart-container">
            {/* Header */}
            <div className="hebekery-cart-header">
                <h1 className="hebekery-cart-title">
                    <FaShoppingCart className="me-3" />
                    GIỎ HÀNG CỦA BẠN
                </h1>
                <p style={{margin: 0, opacity: 0.9, fontSize: '1.1rem'}}>Quản lý sản phẩm và thanh toán dễ dàng</p>
            </div>

            {/* Promotion Banner */}
            <div className="hebekery-promotion-banner">
                🎉 Miễn phí vận chuyển đơn từ 500k - Ưu đãi đặc biệt cho khách hàng thân thiết! 🎉
            </div>

            {cartItems.length === 0 ? (
                <div className="hebekery-empty-cart">
                    <FaShoppingCart size={60} color="#ccc" />
                    <h3>Giỏ hàng của bạn đang trống</h3>
                    <p>Hãy thêm sản phẩm vào giỏ hàng để tiếp tục mua sắm</p>
                    <Link
                        to="/"
                        className="hebekery-continue-shopping"
                        onClick={(e) => {
                            e.preventDefault();
                            startTransition(() => {
                                navigate("/");
                            });
                        }}
                    >
                        <FaHome className="me-2" />
                        Tiếp tục mua sắm
                    </Link>
                </div>
            ) : (
                <div className="hebekery-cart-content">
                    {/* Cart Items */}
                    <div className="hebekery-cart-items">
                        {/* Select All */}
                        <div className="hebekery-select-all">
                            <Form.Check
                                type="checkbox"
                                checked={selectAll}
                                onChange={handleSelectAll}
                                id="select-all"
                            />
                            <label htmlFor="select-all">Chọn tất cả ({cartItems.length} sản phẩm)</label>
                        </div>

                        {/* Cart Items List */}
                        {cartItems.map((item, idx) => (
                            <div key={item.id} className="hebekery-cart-item">
                                <Form.Check
                                    type="checkbox"
                                    checked={item.selected}
                                    onChange={(e) => handleSelectItem(item.id, e.target.checked)}
                                    className="hebekery-item-checkbox"
                                />

                                <img
                                    src={item.avatar || '/images/default-product.png'}
                                    alt={item.name}
                                    className="hebekery-item-image"
                                />

                                <div className="hebekery-item-details">
                                    <h4 className="hebekery-item-name">{item.name}</h4>
                                    <div className="hebekery-item-price">{formatPrice(item.price)}</div>

                                    <div className="hebekery-quantity-controls">
                                        <button
                                            className="hebekery-quantity-btn"
                                            onClick={() => handleQuantityChange(item.id, Math.max(1, item.quantity - 1))}
                                        >
                                            <FaMinus />
                                        </button>
                                        <input
                                            type="number"
                                            value={item.quantity}
                                            min="1"
                                            onChange={(e) => handleQuantityChange(item.id, Number(e.target.value))}
                                            className="hebekery-quantity-input"
                                        />
                                        <button
                                            className="hebekery-quantity-btn"
                                            onClick={() => handleQuantityChange(item.id, item.quantity + 1)}
                                        >
                                            <FaPlus />
                                        </button>
                                    </div>
                                </div>

                                <button
                                    className="hebekery-remove-btn"
                                    onClick={() => handleRemoveItem(item.id)}
                                >
                                    <FaTrashAlt />
                                    Xóa
                                </button>
                            </div>
                        ))}

                        <Link
                            to="/"
                            className="hebekery-continue-shopping"
                            onClick={(e) => {
                                e.preventDefault();
                                startTransition(() => {
                                    navigate("/");
                                });
                            }}
                        >
                            <FaHome className="me-2" />
                            Tiếp tục mua sắm
                        </Link>
                    </div>

                    {/* Cart Summary */}
                    <div className="hebekery-cart-summary">
                        <h3 className="hebekery-summary-title">TỔNG TIỀN</h3>

                        {/* Shipping Info */}
                        <div className="hebekery-shipping-info">
                            <h6>🚚 Thông tin vận chuyển & Ưu đãi</h6>
                            <div className="hebekery-shipping-option">
                                <span>FREESHIP toàn quốc đơn từ 500k</span>
                                <span style={{color: '#1976d2', fontWeight: 'bold'}}>Miễn phí</span>
                            </div>
                            <div className="hebekery-shipping-option">
                                <span>GIẢM 5% đơn từ 200k - Mã HOME5</span>
                                <span style={{color: '#1976d2', fontWeight: 'bold'}}>-5%</span>
                            </div>
                            <div className="hebekery-shipping-option">
                                <span>GIẢM 50k đơn từ 1tr - Mã HOME50</span>
                                <span style={{color: '#1976d2', fontWeight: 'bold'}}>-50k</span>
                            </div>
                            <div className="hebekery-shipping-option">
                                <span>GIẢM 100k đơn từ 2tr - Mã HOME100</span>
                                <span style={{color: '#1976d2', fontWeight: 'bold'}}>-100k</span>
                            </div>
                            <div className="hebekery-shipping-option">
                                <span>Bảo hành chính hãng & Đổi trả 7 ngày</span>
                                <span style={{color: '#1976d2', fontWeight: 'bold'}}>✓</span>
                            </div>
                        </div>

                        <div className="hebekery-summary-row">
                            <span>Số lượng sản phẩm:</span>
                            <span>{itemCount}</span>
                        </div>

                        <div className="hebekery-summary-row">
                            <span>Tổng tiền:</span>
                            <span>{formatPrice(getTotalPrice())}</span>
                        </div>

                        <button
                            className="hebekery-checkout-btn"
                            onClick={handleCheckout}
                            disabled={itemCount === 0}
                        >
                            ĐẶT HÀNG NGAY
                            <br />
                            <small>Thanh toán an toàn & bảo mật</small>
                        </button>

                        <button
                            className="hebekery-clear-cart"
                            onClick={handleRemoveAllCart}
                        >
                            Xóa tất cả
                        </button>
                    </div>
                </div>
            )}
        </div>
    );
};

export default Cart;
