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
        <div class="kennel_container_close" v-show="!showCreator" @click="closeCreator">
          <image />
        </div>
      </div>
      <div class="kennel_creator_body">
      </div>
    </div>
  `,
  components: { KennelCreatorCheckbox, KennelCreatorInput, KennelCreatorDropdown }
}