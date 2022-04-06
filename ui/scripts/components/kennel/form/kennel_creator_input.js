const KennelCreatorInput = {
  props: {
    label: { type: String, required: false, default: "Default Input" }
  },
  methods: {
    InputChanged(e) {
      this.$emit("changed", e.target.value);
    }
  },
  template: `
    <div class="kennel_creator_input">
      <div class="kennel_creator_input_label">{{ label }}</div>
      <input type="text" v-on:input="InputChanged" />
    </div>
  `
}