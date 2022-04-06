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
    }
  },
  template: `
    <div class="kennel_creator">
      <div class="kennel_creator_header">K9 CREATOR</div>
      <div class="kennel_creator_body">
      </div>
    </div>
  `,
  components: { KennelCreatorCheckbox, KennelCreatorInput, KennelCreatorDropdown }
}