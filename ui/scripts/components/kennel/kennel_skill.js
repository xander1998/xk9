const KennelSkill = {
  props: {
    name: { type: String, required: true },
    level: { type: Number, required: true },
    trained: { type: String, required: false }
  },
  template: `
    <div class="kennel_skill">
      <div class="kennel_skill_header">{{ name }}</div>
      <div class="kennel_skill_level" v-if="trained">
        <div>Level:</div>
        <div>{{ level }}</div>
      </div>
      <div :class="{ 'kennel_skill_trained': true, 'kennel_skill_centered': !trained, 'kennel_skill_spaced': trained }">
        <div v-if="trained">Trained:</div>
        <div>{{ trained || 'Not Trained' }}</div>
      </div>
    </div>
  `
}