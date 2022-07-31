import { Route, Routes } from "react-router-dom";
import { lazy, Suspense } from "react";
import LoadingScreen from "../components/LoadingScreen";
import GuestGuard from "../guards/GuestGuard";
import AuthGuard from "../guards/AuthGuard";
import AuthLayout from "../layouts/login/AuthLayout";
import ContentLayout from "../layouts/main/ContentLayout";

const Loadable = (Component) => (props) => {
  return (
    <Suspense fallback={<LoadingScreen />}>
      <Component {...props} />
    </Suspense>
  );
};

const Router = () => {
  return (
    <Routes>
      <Route path="/login" element={ <GuestGuard> <AuthLayout /> </GuestGuard> }>
        <Route index element={<Login />} />
      </Route>

      <Route path="/" element={ <AuthGuard> <ContentLayout /> </AuthGuard> }>
        <Route index element={<Dashboard />} />
        <Route path="/product" element={<Product />} />
        <Route path="/product-detail/:id" element={<ProductDetail />} />
      </Route>
      
      <Route path="*" element={<div className="text-center">Page Not Found..!!</div>} />
    </Routes>
  );
};

// Authentication
const Login = Loadable(lazy(() => import("../pages/auth/Login")));

// Dashboard
const Dashboard = Loadable(lazy(() => import("../pages/Dashboard")));
const Product = Loadable(lazy(() => import("../pages/Product")));
const ProductDetail = Loadable(lazy(() => import("../pages/ProductDetail")));

export default Router;
