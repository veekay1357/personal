package com.hemand.ebanking.factoryclass;

public abstract class User
{ int count;
  abstract void getCount();

}

class Admin extends User
{
  public void getCount()
  {
	  count=25;
  }
}

class Employee extends User
{
  public void getCount()
  {
	  count=20;
  }
}

class Nuser extends User
{
  public void getCount()
  {
	  count=10;
  }
}
