const KennelCreator = {
  data() {
    return {
      name: "Default Name",
      isMale: false
    }
  },
  methods: {
    isMaleChanged(value) {
      this.isMale = value;
    },
    nameChanged(value) {
      this.name = value;
    },
    closeCreator() {
      this.$emit("close");
    }
  },
  template: `
    <div class="kennel_creator">
      <div class="kennel_creator_header">
        K9 CREATOR
        <div class="kennel_container_close" @click="closeCreator">
          <image />
        </div>
      </div>
      <div class="kennel_creator_body">
        <kennel-creator-input label="Name" />
        <kennel-creator-checkbox label="Is this a male K9?" />
        <kennel-creator-dropdown label="Color Style" />
        <kennel-creator-dropdown label="K9 Type" />
      </div>
    </div>
  `,
  components: { KennelCreatorCheckbox, KennelCreatorInput, KennelCreatorDropdown }
}