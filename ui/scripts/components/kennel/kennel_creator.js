const KennelCreator = {
  data() {
    return {
      isMale: false
    }
  },
  methods: {
    isMaleChanged(value) {
      this.isMale = value;
    }
  },
  template: `
    <div class="kennel_creator">
      <div class="kennel_creator_header">Design Your K9</div>
      <div class="kennel_creator_body">
        <kennel-creator-checkbox label="Male" @changed="isMaleChanged" />
        {{ isMale }}
      </div>
    </div>
  `,
  components: { KennelCreatorCheckbox }
}