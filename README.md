// malloc and calloc allocate memory dynamically. Return value is pointer to the memory. If memory is not allocated then nullptr is returned.
// free is used to deallocate the memory
// realloc returns new pointer to the newly allocated memory. Deallocates the original memory.
// Previous memory contents are preserved at the new location. Additional memory can contain any value.

int main()
{
	int* ptr1 = ( int* )malloc( 10 * sizeof( int ) );
	int* ptr2 = ( int* )calloc( 10 , sizeof( int ) );

	if ( NULL == ptr1 )
	{
		printf( "Memory not allocated using malloc\n" );
	}
	if ( NULL == ptr2 )
	{
		printf( "Memory not allocated using calloc\n" );
	}

	for ( int i = 0; i < 10; ++i )
	{
		*( ptr1 + i ) = i;
	}


	int* newptr = ( int* )realloc( ptr1, 20 * sizeof( int ) );

	for ( int i = 0; i < 20; ++i )
	{
		printf( "%d ", *( newptr + i ) );       // 0 1 2 3 4 5 6 7 8 9 0 0 0 0 0 0 0 0 0 0
	}

	free( newptr );
	free( ptr2 );
}
