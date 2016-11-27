package Alien::SwaggerUI;
our $VERSION = '0.002';
# ABSTRACT: Render OpenAPI spec documentation with Swagger-UI

=head1 SYNOPSIS

    use Alien::SwaggerUI;
    my $app_dir = Alien::SwaggerUI->root_dir;

    #-- Serve Swagger-UI with Mojolicious::Lite
    use File::Spec::Functions qw( catfile );
    use Alien::SwaggerUI;
    use Mojolicious::Lite;

    get '/swagger/*path' => { path => 'index.html' }, sub {
        my ( $c ) = @_;
        my $path = catfile( Alien::SwaggerUI->root_dir, $c->stash( 'path' ) );
        my $file = Mojo::Asset::File->new( path => $path );
        $c->reply->asset( $file );
    };

    app->start;

=head1 DESCRIPTION

This module contains L<Swagger UI|http://swagger.io/swagger-ui/>. This
pure-JavaScript application renders beautiful documentation for your
application's L<OpenAPI specification|https://www.openapis.org>.

The application is contained in a C<share/> directory. You can get the path
to this directory with the L</root_dir> method.

To render your specific API documentation, pass it in with the
C<?url=/path/to/spec> query parameter.

=head1 SEE ALSO

=over

=item L<Swagger UI|http://swagger.io/swagger-ui/>

=item L<OpenAPI specification|https://www.openapis.org>

=back

=cut

use strict;
use warnings;
use File::Share qw( dist_dir );

sub root_dir {
    return dist_dir( 'Alien-SwaggerUI' );
}

1;

