# script for index page

window.App = {}

# make dummy Note models
initializeNotes = () ->
  noteCollection = new App.NoteCollection [
    title: 'テスト1'
    body : 'テスト1だってばよ'
  ,
    title: 'テスト2'
    body : 'テスト2だよん'
  ,
    title: 'テスト3'
    body : 'テスト3だよおおおお'
  ]

  noteCollection.each (note) ->
    note.save()

  return noteCollection.models

$ () ->
  # intialize NoteCollection
  # make reference on 'App' because
  # you use this collection on another js file later
  App.noteCollection = new App.NoteCollection

  # initialize App.Container for the space
  # that shows view of notes list
  # make reference on 'App' in the same way
  App.mainContainer = new App.Container
    el: '#main-container'

  # receive data of NoteCollection
  # it's from local storage by Backbone.LocalStorage
  App.noteCollection.fetch().then (notes) ->
    # if data is empte, overwrite collection by dummy data
    if notes.length == 0
      models = initializeNotes()
      App.noteCollection.reset models

    # initialize parent view by collection
    noteListView = new App.NoteListView
      collection: App.noteCollection

    # show notes list
    App.mainContainer.show noteListView

    # initialization of router and start managing history
    App.router = new App.Router()
    Backbone.history.start()
