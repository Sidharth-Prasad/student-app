import { Component, OnInit } from '@angular/core';
// import { Student } from "../../model/student";
import { StudentService } from "../../service/student.service";
import { Student } from "../../model/student";


@Component({
  selector: 'app-student-form',
  templateUrl: './student-form.component.html',
  styleUrls: ['./student-form.component.css']
})
export class StudentFormComponent implements OnInit {
  studentData: any;
  worldData: any;
  hidden: boolean = false;
  constructor(private _studentService: StudentService) { }

  ngOnInit() {
    var me = this;
    this._studentService.getConfigData();
    this._studentService.readConfigDataObservable.subscribe(val => {
      console.log(val);
      if (Object.keys(val).length > 0) {
        me.studentData = val;
        me.hidden = true;
      }
    });
    this._studentService.getWorldData();
    this._studentService.readWorldDataObservable.subscribe(val => {
      console.log(val);
      if (Object.keys(val).length > 0) {
        me.worldData = val;
        me.hidden = true;
      }
    });

  }



  model = new Student(12, "Boston", "Male", 2.0, "Asian", "Hinduism", "Finance", "Business", "Visual Arts");

  submitted = false;

  onSubmit() {
  this.submitted = true;
  this._studentService.postFormData(this.model);
  console.log(JSON.stringify(this.model))
  }

  // newStudent(){
  //   this.model = new Student();
  // }

  //get diagnostic() { return JSON.stringify(this.model); }
}
