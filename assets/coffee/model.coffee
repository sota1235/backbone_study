# model.coffee
#
# Description:
#   Backbone model file for index page
#
# Author:
#   sota1235

App.Note = Backbone.Model.extend
  defaults:
    title: ''
    body : ''

App.NoteCollection = Backbone.Collection.extend
  localStorage: new Backbone.LocalStorage 'Notes'
  model: App.Note
