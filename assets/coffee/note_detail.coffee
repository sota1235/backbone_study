# note_detail.coffee
#
# Description:
#   View file for note's detail
#
# Author:
#   sota1235

App.NoteDetailView = Backbone.View.extend
  render: () ->
    template = _.template $('#noteDetailView-template').html()
    html     = template this.model.toJSON()
    this.$el.html html
    return this
