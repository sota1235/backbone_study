# note_list_item.coffee
#
# Description:
#   Backbone view for note list
#
# Author:
#   sota1235

App.NoteListItemView = Backbone.View.extend
  tagName: 'tr'
  render: () ->
    template = _.template $('#noteListItemView-template').html()
    html     = template this.model.toJSON()
    this.$el.html html
    return this
