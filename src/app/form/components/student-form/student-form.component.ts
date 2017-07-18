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
  constructor(private _studentService: StudentService) {
    

  }

  ngOnInit() {
    var me = this; 
   this._studentService.getConfigData();
   this._studentService.readConfigDataObservable.subscribe(val => {
    console.log(val);
    if(Object.keys(val).length >0){
      me.studentData = val;
      me.hidden = true;
    }
   });
   this._studentService.getWorldData();
   this._studentService.readWorldDataObservable.subscribe(val => {
    console.log(val);
    if(Object.keys(val).length >0){
      me.worldData = val;
      me.hidden = true;
    }
   });

  }
  university = ['UW', 'Purdue', 'CMU', 'Boston'];


  model = new Student(2319, 'Mike Wazowski', '18-21','UW','Public','100s','<10','<2.0','Engineering','Before 2017','Football','Comics','Photography','Study Abroad');

  submitted = false;

  onSubmit() { this.submitted = true; }

  // newStudent(){
  //   this.model = new Student();
  // }

  // get diagnostic() { return JSON.stringify(this.model); }
}
