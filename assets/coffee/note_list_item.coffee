# note_list_item.coffee
#
# Description:
#   Backbone view for note list
#
# Author:
#   sota1235

App.NoteListItemView = Backbone.View.extend
  tagName: 'tr'

  initialize: () ->
    # watch destroy event of model and
    # call remove() function of Backbone.View
    this.listenTo this.model, 'destroy', this.remove

  # watch [Delete] button and
  # call onClickDelete()
  events:
    'click .js-delete': 'onClickDelete'

  render: () ->
    template = _.template $('#noteListItemView-template').html()
    html     = template this.model.toJSON()
    this.$el.html html
    return this

  onClickDelete: () ->
    # remove model
    this.model.destroy()
