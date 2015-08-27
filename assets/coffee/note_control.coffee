# note_control.coffee
#
# Description:
#   View file for create new note
#
# Author:
#   @sota1235

App.NoteControlView = Backbone.View.extend

  events:
    'submit .js-search-form': 'onSubmit'

  render: () ->
    html = $('#noteControlView-template').html()
    this.$el.html html
    return this

  onSubmit: (e) ->
    e.preventDefault()
    query = @$('.js-search-query').val()
    @trigger 'submit:form', query
