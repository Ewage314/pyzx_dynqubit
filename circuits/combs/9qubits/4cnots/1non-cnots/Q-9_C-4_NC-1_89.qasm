OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
x q[1];
cx q[4], q[7];
cx q[7], q[5];
cx q[4], q[0];
cx q[8], q[1];
