const Kennel = {
  props: {
    dogs: { type: Array, required: true }
  },
  template: `
    <div class="kennel_container">
      <div class="kennel_header">KENNEL</div>
      <div class="kennel_body">
        <kennel-card v-for="(dog, dogIndex) in dogs" :dog="dog"></kennel-card>
      </div>
    </div>
  `,
  components: { KennelCard }
}