const Kennel = {
  props: {
    dogs: { type: Array, required: true, default: [] }
  },
  data() {
    return {
      showCreator: true
    }
  },
  methods: {
    CloseCreator() {
      this.showCreator = false;
    }
  },
  template: `
    <div class="kennel_container">
      <div class="kennel_header">
        KENNEL
        <div class="kennel_header_creator_open" v-show="!showCreator" @click="showCreator = true">+</div>
      </div>
      <div class="kennel_body">
        <kennel-card :id="dogIndex" v-for="(dog, dogIndex) in dogs" :dog="dog"></kennel-card>
      </div>
      <div class="kennel_container_grayscale" v-if="showCreator"></div>
      <kennel-create-form
        :class="showCreator ? 'kennel_create_form_animate_in' : 'kennel_create_form_animate_out'"
        @close="CloseCreator">
      </kennel-create-form>
    </div>
  `,
  components: { KennelCard, KennelCreateForm }
}