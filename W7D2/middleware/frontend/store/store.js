import { createStore } from 'redux';
import rootReducer from '../reducers/root_reducer';
import { applyMiddleware } from 'redux';

const configureStore = (preloadedState = {}) => {
  const store = createStore(rootReducer, preloadedState,
  applyMiddleware(addLoggingToDispatch, adderFunction)
  );
  store.subscribe(() => {
    localStorage.state = JSON.stringify(store.getState());
  });
  return store;
};

const addLoggingToDispatch = store => next => action => {
  console.log("Before action", store.getState());
  console.log("Action", action);
  next(action);
  console.log("After action", store.getState());
};

const adderFunction = store => next => action => {
  console.log("1 + 1 = 2" );
  next(action);
};

export default configureStore;
