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
  resultData: any[] = [{ "name": "Test", "description": "Test Description" }, { "name": "Test", "description": "Test Description" }, { "name": "Test", "description": "Test Description" }];
  hidden: boolean = false;
  constructor(private _studentService: StudentService) { }

  ngOnInit() {
    var me = this;
    console.log(this.model);

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

    this._studentService.readResultDataObservable.subscribe(val => {
      console.log(val.length, val);
      if (Object.keys(val).length > 0) {
        // me.resultData = val[0];
        // me.hidden = true;
      }
    });

  }



  model = new Student(18, "Boston", "Male", 2.0, "Asian", "Hinduism", "Finance", "Business", "Visual Arts");

  submitted = false;

  newStudent() {
    this.submitted = false;
    this.model = new Student(-1, '', '', 1, '', '', '', '', '');
  }

  sampleStudent() {
    this.submitted = false;
    this.model = new Student(18, 'Boston', 'Male', 2, 'Asian', 'Hinduism', 'Retail', 'Business', 'Visual Arts');
  }

  onSubmit() {
    var me = this;

    this.submitted = true;
    this._studentService.postFormData(this.model);



    //console.log("Result: "+me.resultData);
  }

  // newStudent(){
  //   this.model = new Student();
  // }

  //get diagnostic() { return JSON.stringify(this.model); }
}
