#!/usr/bin/env coffee
echo = console.log
dd = require 'ddeyes'
co = require 'co'

# { getTodos } = require './helper'
#
# task =
#   cleanTodos: require './cleanTodos'
#   addTodos: require './addTodos'
#   modifyTodo: require './modifyTodo'
#
# tasks = [
#   task.cleanTodos
#   task.addTodos
#   task.modifyTodo
# ]
server = require '../../src/services/index'
echo server.cus_post
# co do ->

  # for task in tasks
  #
  #   yield from task()
  #   todos = yield getTodos()
  #   dd todos
server.cus_post 'index', {
  icon: 0
  page: 1
}, -> echo 'success'
