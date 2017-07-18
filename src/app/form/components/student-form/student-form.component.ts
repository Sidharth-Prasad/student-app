import { Component, OnInit } from '@angular/core';
// import { Student } from "../../model/student";
import { StudentService } from "../../service/student.service";

@Component({
  selector: 'app-student-form',
  templateUrl: './student-form.component.html',
  styleUrls: ['./student-form.component.css']
})
export class StudentFormComponent implements OnInit {
  data: any;
  hidden: boolean = false;
  constructor(private _studentService: StudentService) {
    

  }

  ngOnInit() {
    var me = this;
  //  this._studentService.getWorldData(); 
   this._studentService.getConfigData();
   this._studentService.readConfigDataObservable.subscribe(val => {
    console.log(val);
    if(Object.keys(val).length >0){
      me.data = val;
      me.hidden = true;
    }
   });
  }
  university = ['UW', 'Purdue', 'CMU', 'Boston'];


  // model = new Student(2319, 'Mike Wazowski', );

  submitted = false;

  onSubmit() { this.submitted = true; }

  // get diagnostic() { return JSON.stringify(this.model); }
}
