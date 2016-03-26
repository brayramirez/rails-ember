import Ember from 'ember';

export default Ember.Component.extend({

  isEditable: false,

  actions: {
    updateRecord: function(){
      this.get('onUpdate')();
      this.set('isEditable', false);
    },

    deleteRecord: function(){
      this.get('onDelete')();
    },

    postEditable: function(){
      this.set('isEditable', true);
    },

    postViewable: function(){
      this.set('isEditable', false);
    }
  }

});
