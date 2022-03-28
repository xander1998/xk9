const KennelCreateInput = {
  props: {
    label: { type: String, required: true },
    placeholder: { type: String, required: false }
  },
  data() {
    return {
      inputValue: ""
    }
  },
  methods: {
    fireInput() {
      this.$emit("input", this.inputValue);
    }
  },
  template: `
    <div class="kennel_create_input">
      <div class="kennel_create_input_label">{{ label }}</div>
      <input :placeholder="placeholder" type="text" class="kennel_create_input_handler" v-model="inputValue" @input="fireInput" />
    </div>
  `
}