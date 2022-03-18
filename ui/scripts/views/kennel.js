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
      <div class="kennel_header">KENNEL</div>
      <div class="kennel_body">
        <kennel-card v-for="(dog, dogIndex) in dogs" :dog="dog"></kennel-card>
      </div>
      <kennel-create-form v-show="showCreator"></kennel-create-form>
    </div>
  `,
  components: { KennelCard, KennelCreateForm }
}