# script for index page

window.App = {}

# test for backbone.js
$ () ->
  noteCollection = new App.NoteCollection [
    title: 'テスト1'
    body : 'テスト1だお'
  ,
    title: 'テスト2'
    body : 'テスト2だってばよ'
  ]

  mainContainer = new App.Container
    el: '#main-container'

  noteListView = new App.NoteListView
    collection: noteCollection

  mainContainer.show noteListView
