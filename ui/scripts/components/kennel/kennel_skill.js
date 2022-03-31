const KennelSkill = {
  props: {
    name: { type: String, required: true },
    level: { type: Number, required: true },
    trained: { type: String, required: true }
  },
  template: `
    <div class="kennel_skill">
      <div class="kennel_skill_header">{{ name }}</div>
      <div class="kennel_skill_level">
        <div>Level:</div>
        <div>{{ level }}</div>
      </div>
      <div class="kennel_skill_trained">
        <div>Trained:</div>
        <div>{{ trained }}</div>
      </div>
    </div>
  `
}