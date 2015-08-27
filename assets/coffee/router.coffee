# router.coffee
#
# Description:
#   routing file for Backbone.js
#
# Author:
#   sota1235

App.Router = Backbone.Router.extend
  routes:
    'notes/:id'           : 'showNoteDetail'
    'new'                 : 'showNewNote'
    'notes/:id/edit'      : 'showEditNote'
    'notes/search/:query' : 'searchNote'
    '*actions'            : 'defaultRoute'

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

  showNoteList: (models) ->

    if !@filteredCollection
      @filteredCollection = new App.NoteCollection()

    if !App.mainContainer.has App.NoteListView
      noteListView = new App.NoteListView
        collection: @filteredCollection
      App.mainContainer.show noteListView

    models = models || App.noteCollection.models

    @filteredCollection.reset models
    @showNoteControl()

  showNoteControl: () ->
    noteControlView = new App.NoteControlView()

    noteControlView.on 'submit:form', (query) ->
      @searchNote query
      @navigate 'notes/search/' + query
    , @
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

  searchNote: (query) ->
    filtered = App.noteCollection.filter (note) ->
      return note.get('title').indexOf(query) != -1
    @showNoteList filtered
