OPENQASM 2.0;
include "qelib1.inc";
qreg q[7];
x q[4];
cx q[6], q[5];
cx q[4], q[0];
x q[4];
cx q[5], q[0];
cx q[5], q[1];
