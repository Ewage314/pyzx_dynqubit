OPENQASM 2.0;
include "qelib1.inc";
qreg q[7];
cx q[6], q[0];
x q[1];
x q[2];
x q[1];
x q[5];
cx q[6], q[1];
