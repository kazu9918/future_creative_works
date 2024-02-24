class HealthCondition < ActiveHash::Base
  self.data = [
    { id: 1, category: '0. 健康上の問題や不調はない' },
    { id: 2, category: '1. アレルギーによる疾患（花粉症・アレルギー性結膜炎など）' },
    { id: 3, category: '2. 皮膚の病気・かゆみ（湿疹やアトピー性湿疹など）' },
    { id: 4, category: '3. 感染症による不調（風邪、インフルエンザ、胃腸炎）' },
    { id: 5, category: '4. 胃腸に関する不調（繰り返す下痢、便秘、胃不快感）' },
    { id: 6, category: '5. 手足の関節の痛みや不自由さ（関節炎など）' },
    { id: 7, category: '6. 腰痛' },
    { id: 8, category: '7. 首の不調や肩のこりなど' },
    { id: 9, category: '8. 頭痛（偏頭痛や慢性的な頭痛など）' },
    { id: 10, category: '9. 歯の不調（歯痛など）' },
    { id: 11, category: '10. 精神関する不調（うつ症状（気分の落ち込みなど）、不安感）' },
    { id: 12, category: '11. 睡眠に関する不調（寝ようとしても寝れないなど）' },
    { id: 13, category: '12. 全身の倦怠感、疲労感' },
    { id: 14, category: '13. 眼の不調（視力低下・眼精疲労・ドライアイ・緑内障など）' },
    { id: 15, category: '14. その他不調など' },
  ]
end
