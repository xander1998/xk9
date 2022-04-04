const KennelCreatorCheckbox = {
  props: {
    label: { type: String, required: false, default: "Default Checkbox" }
  },
  data() {
    return {
      checked: false
    }
  },
  methods: {
    CheckboxChanged() {
      this.checked = !this.checked
      this.$emit("changed", this.checked);
    }
  },
  template: `
    <div class="kennel_creator_checkbox">
      <div class="kennel_creator_checkbox_label">{{ label }}</div>
      <input type="checkbox" @input="CheckboxChanged" />
    </div>
  `
}