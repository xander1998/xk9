const KennelCreator = {
  data() {
    return {
      name: "Default Name",
      isMale: false,
      color: 0,
      type: 0,
      dogColors: ["Black/White", "White/Grey", "Black", "Brown/Black"],
      dogTypes: ["Police", "Sheriff", "Rescue"]
    }
  },
  methods: {
    isMaleChanged(value) {
      this.isMale = value;
    },
    nameChanged(value) {
      this.name = value;
    },
    colorChanged(value) {
      this.color = value;
    },
    typeChanged(value) {
      this.type = value;
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
        <kennel-creator-input label="Name" @changed="nameChanged" />
        <kennel-creator-checkbox label="Is this a male K9?" @changed="isMaleChanged" />
        <kennel-creator-dropdown label="Color Style" :items="dogColors" @itemChanged="" />
        <kennel-creator-dropdown label="K9 Type" :items="dogTypes" @itemChanged="" />
      </div>
    </div>
  `,
  components: { KennelCreatorCheckbox, KennelCreatorInput, KennelCreatorDropdown }
}