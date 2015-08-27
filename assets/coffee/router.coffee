# router.coffee
#
# Description:
#   routing file for Backbone.js
#
# Author:
#   sota1235

App.Router = Backbone.Router.extend
  routes:
    'notes/:id'      : 'showNoteDetail'
    'new'            : 'showNewNote'
    'notes/:id/edit' : 'showEditNote'
    '*actions'       : 'defaultRoute'

  # you can receive the 'id' param router received
  # as argument named 'id'
  showNoteDetail: (id) ->
    note = App.noteCollection.get id
    noteDetailView = new App.NoteDetailView
      model: note
    App.mainContainer.show noteDetailView

    # remove [New Note] button
    App.headerContainer.empty()

  # any routing pattern not matching
  defaultRoute: () ->
    this.showNoteList()
    this.navigate 'notes'

  showNoteList: () ->
    noteListView = new App.NoteListView
      collection: App.noteCollection
    App.mainContainer.show noteListView
    # call function to show view controls notes
    this.showNoteControl()

  showNoteControl: () ->
    noteControlView = new App.NoteControlView()
    App.headerContainer.show noteControlView

  showNewNote: () ->
    self = @
    noteFormView = new App.NoteFormView
      model: new App.Note()

    noteFormView.on 'submit:form', (attrs) ->
      App.noteCollection.create attrs

      self.showNoteList()
      self.navigate 'notes'

    App.mainContainer.show noteFormView
    App.headerContainer.empty()

  showEditNote: (id) ->
    self = @
    note = App.noteCollection.get id
    noteFormView = new App.NoteFormView
      model: note

    noteFormView.on 'submit:form', (attrs) ->
      note.save attrs

      self.showNoteDetail note.get 'id'
      self.navigate 'notes/' + note.get 'id'

    App.mainContainer.show noteFormView
