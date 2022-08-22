import 'package:flutter/material.dart';
import 'package:hackathon_project/presentation/resources/color_manager.dart';
import 'package:hackathon_project/presentation/resources/strings_manager.dart';
import 'package:hackathon_project/presentation/resources/values_manager.dart';

class SearchInput extends StatefulWidget {
  const SearchInput({Key? key}) : super(key: key);

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  @override
  Widget build(BuildContext context) {
    var height =  MediaQuery.of(context).size.height;
    var width =  MediaQuery.of(context).size.width;
    return SizedBox(
      width: width * .9,
      height: height /12,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: width *.75,
            decoration: const BoxDecoration(
                color: ColorManager.searchBackGround,
              borderRadius: BorderRadius.all(Radius.circular(12))
            ),
            child: TextFormField(
              cursorColor: ColorManager.primary,
              decoration:   const InputDecoration(
                hintText: AppStrings.search,
                prefixIcon: Icon(Icons.search,color: ColorManager.greyText),
                  border: InputBorder.none,
              ),
              ),
          ),
        Container(
          height: AppSize.s45,
          width: AppSize.s45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(59)
          ),
          child: ElevatedButton(
            onPressed: (){},
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              backgroundColor: ColorManager.primary,
            ),
            child: const Icon(Icons.shopping_cart_outlined,size: AppSize.s25,),
          ),
        ),
        ],
      ),
    );
  }
}
