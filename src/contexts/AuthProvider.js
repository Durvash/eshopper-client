import React, { createContext, useEffect, useReducer } from "react";
import axios from "../helpers/Axios";
import { isValidToken, setSession } from "../helpers/CreateSession";

const initialState = {
  isAuthenticated: false,
  isInitialized: false,
  user: null,
};

const handlers = {
  INITIALIZE: (state, action) => {
    const { isAuthenticated, user } = action.payload;
    // console.log(isAuthenticated, user);
    return {
      ...state,
      isAuthenticated,
      isInitialized: true,
      user,
    };
  },
  LOGIN: (state, action) => {
    const { user } = action.payload;
    return {
      ...state,
      isAuthenticated: true,
      user,
    };
  },
  LOGOUT: (state) => ({
    ...state,
    isAuthenticated: false,
    user: null,
  }),
  REGISTER: (state, action) => {
    const { user } = action.payload;
    return {
      ...state,
      isAuthenticated: true,
      user,
    };
  },
};

const AuthContext = createContext({
  ...initialState,
  login: () => Promise.resolve(),
  // logout: () => Promise.resolve(),
  // register: () => Promise.resolve(),
});

const loginReducer = (loginState, action) => (handlers[action.type] ? handlers[action.type](loginState, action) : loginState);

const AuthProvider = ({children}) => {
  const [loginState, dispatch] = useReducer(loginReducer, initialState);

  useEffect(() => {
    const initialize = async () => {
      try {
        const accessToken = window.localStorage.getItem('accessToken');
        
        if (accessToken && isValidToken(accessToken)) {
          setSession(accessToken);
          
          const response = await axios.get('account');
          const { user } = response;
          // console.log('user : ',response,user);
          dispatch({
            type: 'INITIALIZE',
            payload: {
              isAuthenticated: true,
              user,
            },
          });
        } else {
          dispatch({
            type: 'INITIALIZE',
            payload: {
              isAuthenticated: false,
              user: null,
            },
          });
        }
      } catch (err) {
        console.error(err);
        dispatch({
          type: 'INITIALIZE',
          payload: {
            isAuthenticated: false,
            user: null,
          },
        });
      }
    };

    initialize();
    // console.log('login-state : ',loginState,children);
  }, []);

  const login = async (username, password) => {
    const response = await axios.post('login', {
      username,
      password,
    });
    // console.log(response);
    if(response.success)
    {
      const { accessToken, user } = response;
      setSession(accessToken);
      dispatch({
        type: 'LOGIN',
        payload: { user },
      });
    }
  };

  return (
    <AuthContext.Provider
      value={{
        ...loginState,
        login,
        // logout,
        // register,
      }}
    >
      {children}
    </AuthContext.Provider>
  );
};

export { AuthContext, AuthProvider };
