# note_control.coffee
#
# Description:
#   View file for create new note
#
# Author:
#   @sota1235

App.NoteControlView = Backbone.View.extend

  render: () ->
    html = $('#noteControlView-template').html()
    this.$el.html html
    return this
