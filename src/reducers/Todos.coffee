{ assign } = Object
{ reduxActions } = require 'cfx.redux-actions'
{
  handleAction
  handleActions
} = reduxActions

constants = require '../constants/index'

normalizerTodos = (
  require '../initials/index'
).normalizer.todos

{
  LOAD_TODO_STATE
  ADD_TODO_STATE
  MODIFY_TODO_STATE
  REMOVE_TODO_STATE
} = constants.types

SI = require 'cfx.seamless-immutable'

module.exports = handleActions

  LOAD_TODO_STATE: (state, action) ->
    action.payload.todos

  ADD_TODO_STATE: (state, action) ->
    { todo } = action.payload

    SI.Array.push state
    , [ todo ]

  MODIFY_TODO_STATEL: (state, action) ->
    {
      index
      todo
    } = action.payload

    unless index
      index = state.reduce (result, current, _index, array) ->
        if current.id is todo.id
          return _index
        else
          return result
      , null

    SI.Array.set state, index
    , assign {}, state[index], todo

  REMOVE_TODO_STATE: (state, action) ->
    {
      todoId
    } = action.payload

    todo = (
      normalizerTodos state
    ).entities.todoId

    SI.Array.removeItem state, todo
