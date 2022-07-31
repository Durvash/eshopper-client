import React, { useEffect, useState } from "react";
import { Link } from "react-router-dom";
import Dashboard from "../../pages/Dashboard";

const SideBar = () => {

  const [subMenu, setSubMenu] = useState('');
  const [activeMenu, setActiveMenu] = useState('');

  const menu_list = [
    {
      text: 'Dashboard',
      link: '',
      slug: '',
      child: []
    },{
      text: 'Product',
      link: '/',
      slug: 'product',
      child: [
        {
          text: 'Product List',
          link: '/product'
        },
        {
          text: 'Product Category',
          link: '/product-category'
        },
        {
          text: 'Product Attributes',
          link: '/product-attribute'
        },
        {
          text: 'Product Brands',
          link: '/product-brand'
        },
        {
          text: 'Product Tags',
          link: '/product-tags'
        }
      ]
    },{
      text: 'User Master',
      link: '/customer',
      slug: 'user',
      child: [
        {
          text: 'Customer List',
          link: '/customer'
        },{
          text: 'Seller List',
          link: '/seller'
        },{
          text: 'Staff List',
          link: '/staff'
        }
      ]
    },{
      text: 'Role Master',
      link: '/role',
      slug: 'role',
      child: [
        {
          text: 'Role List',
          link: '/role'
        }
      ]
    },{
      text: 'World Zone',
      link: '/country',
      slug: 'worldzone',
      child: [
        {
          text: 'Country List',
          link: '/country'
        },{
          text: 'State List',
          link: '/state'
        },{
          text: 'City List',
          link: '/city'
        }
      ]
    },{
      text: 'Global Setting',
      link: '/tax',
      slug: 'setting',
      child: [
        {
          text: 'Tax Master',
          link: '/tax'
        }
      ]
    }
  ]

  useEffect(() => {
    // setSubMenu(true);
  }, [])

  const handlerSetSubMenu = (x) => {
    setSubMenu(subMenu === x ? '' : x);
    // setActiveMenu(subMenu === x ? '' : 'active');
  }

  const handlerClickSubMenu = (x) => {
    setSubMenu(x);
    // setActiveMenu('active');
  }
  
  return (
    <>
      {/* Left Sidebar Start */}
      <div className="left side-menu">
        <div className="sidebar-inner slimscrollleft">
          {/*- Divider */}
          <div id="sidebar-menu">
            <ul>
              {menu_list.map((item,index) => (
                <li key={index} className="has_sub">
                  <Link to={item.link} className={"waves-effect "+subMenu === item.slug ? 'active' : ''} onClick={() => handlerSetSubMenu(item.slug)}>
                    <i className="fa fa-home"></i> <span> {item.text} </span>
                    {item.child.length > 0 ? <span className="menu-arrow"></span> : ''}
                  </Link>
                  {
                    item.child.length > 0 ? 
                    <ul className="list-unstyled" style={{display: subMenu === item.slug ? 'block' : 'none' }}>
                      {item.child.map((citem,cindex) => (
                        <li key={cindex}>
                          <Link to={citem.link} className={subMenu === item.slug ? 'active' : ''} onClick={() => handlerClickSubMenu(item.slug)}>{citem.text}</Link>
                        </li>
                      ))}
                    </ul>
                    : ''
                  }
                </li>
              ))}
            </ul>
            <div className="clearfix"></div>
          </div>
          <div className="clearfix"></div>
        </div>
      </div>
      {/* Left Sidebar End */}

      {/* Start right Content here */}
      
    </>
  );
};

export default SideBar;
