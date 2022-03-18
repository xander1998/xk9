const Kennel = {
  props: {
    dogs: { type: Array, required: true }
  },
  data() {
    return {
      showCreator: true
    }
  },
  template: `
    <div class="kennel_container">
      <div class="kennel_header">
        KENNEL
        <div class="kennel_header_creator_open" v-show="!showCreator">X</div>
      </div>
      <div class="kennel_body">
        <kennel-card v-for="(dog, dogIndex) in dogs" :dog="dog"></kennel-card>
      </div>
      <div class="kennel_container_grayscale" v-show="showCreator"></div>
      <kennel-create-form :class="{ showCreator: 'kennel_create_form_animate_in' }" v-show="showCreator"></kennel-create-form>
    </div>
  `,
  components: { KennelCard, KennelCreateForm }
}