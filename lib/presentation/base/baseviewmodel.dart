abstract class BaseViewModel extends BaseViewModelInputs with BaseViewModelOutputs{

}

abstract class BaseViewModelInputs{
  void start(); // start view model jop

  void dispose(); // will be called when view model dies

}
abstract class BaseViewModelOutputs{

}