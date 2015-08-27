# router.coffee
#
# Description:
#   routing file for Backbone.js
#
# Author:
#   sota1235

App.Router = Backbone.Router.extend
  routes:
    'notes/:id': 'showNoteDetail'

  # you can receive the 'id' param router received
  # as argument named 'id'
  showNoteDetail: (id) ->
    note = App.noteCollection.get id
    noteDetailView = new App.NoteDetailView
      model: note
    App.mainContainer.show noteDetailView
