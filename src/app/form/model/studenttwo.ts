export class Student {

  constructor(
  public Age: number,
  public Pittsburgh: number,
  public West_Lafayette: number,
  public Boston: number,
  public Seattle: number,
  public Male: number,
  public Female: number,
  public Other_Gender: number,
  public publicGPA: number,
  public American_Indian_Alaska_Native: number,
  public Hispanic_or_Latino: number,
  public publicWhite: number,
  public Black_or_African_American: number,
  public Asian: number,
  public Native_Hawaiin_or_Pacific_Islander: number,
  public Hinduism: number,
  public Christianity: number,
  public Islam: number,
  public Buddhism: number,
  public Atheist: number,
  public Other_Religion: number,
  public Finance: number,
  public Education: number,
  public Retail: number,
  public Logistical_Utility_Services: number,
  public STEM: number,
  public Arts: number,
  public Social_Studies: number,
  public Natural_Sciences: number,
  public Business: number,
  public Engineering: number,
  public Humanities: number,
  public Other_Major: number,
  public Visual_Arts: number,
  public Video_Games: number,
  public Theatre: number,
  public Sports: number,
  public Music: number,
  public Literature: number
  ) 
  {
  }

  update() {
    JSON.stringify(Student)
  }
}