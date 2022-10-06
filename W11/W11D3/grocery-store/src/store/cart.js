const ADD_ITEM = "item/ADD_ITEM";

export const addItem = itemId => ({
    type: ADD_ITEM,
    itemId
})


export default function cartReducer(state = {}, action) {
    Object.freeze(state);
    
    switch(action.type) {
        case ADD_ITEM:
            const nextState = {
                ...state,
                [action.itemId]: {id: action.itemId, count: 1} 
            };
            return nextState;
            //nextState[action.itemId] = {id: action.itemId, count: 1}
            //return nextState;
        default:
            return state;
    }
}