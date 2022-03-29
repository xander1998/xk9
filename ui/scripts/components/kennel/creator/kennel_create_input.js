const KennelCreateInput = {
  props: {
    label: { type: String, required: true },
    placeholder: { type: String, required: false }
  },
  methods: {
    UpdateName(name) {
      this.$emit("updateName", name);
    }
  },
  template: `
    <div class="kennel_create_input">
      <div class="kennel_create_input_label">{{ label }}</div>
      <input
        :placeholder="placeholder"
        type="text"
        class="kennel_create_input_handler"
        v-on:input="UpdateName($event.target.value)"
      />
    </div>
  `
}