const KennelCard = {
  props: {
    dog: { type: Object, required: true }
  },
  template: `
    <div class="kennel_card">
      <kennel-card-actions>
        <div class="kennel_card_action kennel_card_action_success">USE</div>
        <div class="kennel_card_action kennel_card_action_error">DELETE</div>
      </kennel-card-actions>

      <kennel-card-info title="Details">
        <kennel-card-info-data name="Name" :result="dog.name"></kennel-card-info-data>
        <kennel-card-info-data name="Gender" :result="dog.gender"></kennel-card-info-data>
        <kennel-card-info-data name="Color" :result="dog.color"></kennel-card-info-data>
        <kennel-card-info-data name="Recruited" :result="dog.recruited"></kennel-card-info-data>
        </kennel-card-info>

        <kennel-card-info v-for="(skill, skillIndex) in dog.skills" :title="skill.skill + ' Training'">
          <kennel-card-info-data name="Level" :result="skill.level"></kennel-card-info-data>
          <kennel-card-info-data name="Trained" :result="skill.trained || 'Not Trained'"></kennel-card-info-data>
        </kennel-card-info>
    </div>
  `,
  components: { KennelCardInfo, KennelCardInfoData, KennelCardActions }
}