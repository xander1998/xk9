const KennelCreateInput = {
  props: {
    value: {},
    label: { type: String, required: true },
    placeholder: { type: String, required: false }
  },
  template: `
    <div class="kennel_create_input">
      <div class="kennel_create_input_label">{{ label }}</div>
      <input
        :placeholder="placeholder"
        type="text"
        class="kennel_create_input_handler"
        v-bind:value="value"
        v-on:input="$emit('input', $event.target.value)"
      />
    </div>
  `
}