import { Component, OnInit } from '@angular/core';
import { Address } from '../../model/form-model';

@Component({
  selector: 'app-address-form',
  templateUrl: './address-form.component.html',
  styleUrls: ['./address-form.component.css']
})

export class AddressFormComponent implements OnInit {

  constructor() { }

  ngOnInit() {
	  }
  age = ['18-21','21-25','25-30'];
  university = ['UW','Purdue','CMU','Boston']; 
  universityType = ['Public','Private'];
  difficulty = ['100s','200s','300s','400s'];
  courseCount = ['<10','10-19','20-29','30-39','40+'];
  gpa = ['<2.0','2.0-2.49','2.50-2.99','3.00-3.49','3.50+'];
  major = ['Engineering','Sciences','Humanities','Social Studies','Business','Technology','Other'];
  year = ['Before 2017', '2017','2018','2019','2020','2021','2022','After'];
  sports = ['Football', 'Basketball', 'Water Sports']
  
  model = new Address(2319, 'Mike', 21, this.university[1],);

  submitted = false;

  onSubmit() {this.submitted = true; }

  get diagnostic() { return JSON.stringify(this.model); } 

}
